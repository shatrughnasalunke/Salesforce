public class CartDetailsAuraServices
{   
    public static List<shatrughna94__Coupon__c> getCoupon(String Name)
    {
        List<shatrughna94__Coupon__c> coupon=[SELECT Id, Name,shatrughna94__Expired__c,shatrughna94__Remaining_Quantity__c, shatrughna94__Price__c FROM shatrughna94__Coupon__c where Name=:Name];
        return coupon;
    }
    @AuraEnabled
    public static Decimal checkCoupon(String Name, String CartId)
    {
        List<shatrughna94__Coupon__c> couponList =  getCoupon(Name);
        if(couponList !=null && couponList.size() > 0 && !couponList[0].shatrughna94__Expired__c && couponList[0].shatrughna94__Remaining_Quantity__c >0)
        {
            shatrughna94__Cart__c cart = new shatrughna94__Cart__c(Id = CartId, shatrughna94__Coupon__c =couponList[0].Id );
            update cart;
            return couponList[0].shatrughna94__Price__c;
        }
        else
        {
            return null;
        }
    }
    @AuraEnabled
    public static void createCartItems(List<String> beerList ,String cartId)
    {
        List<shatrughna94__Cart_Item__c> cartItemList=new List<shatrughna94__Cart_Item__c>();
        List<shatrughna94__Cart_Item__c> cartItemToUpdate=new List<shatrughna94__Cart_Item__c>();
        Map<Id,shatrughna94__Cart_Item__c> beerQntyMap=getCartItems(cartId);
        for(String beer : beerList)
        {
            if(beerQntyMap != null && beerQntyMap.containsKey(beer))
            {
                shatrughna94__Cart_Item__c it   = beerQntyMap.get(beer);
                shatrughna94__Cart_Item__c item = new shatrughna94__Cart_Item__c
                    (
                        shatrughna94__Item_Quantity__c=it.shatrughna94__Item_Quantity__c+1,
                        id=it.id
                    );
                cartItemList.add(item);
            }
            else
            {
                Integer Qty=1;
                shatrughna94__Cart_Item__c item = new shatrughna94__Cart_Item__c(
                    shatrughna94__Cart__c=cartId,
                    shatrughna94__Beer__c=beer,
                    shatrughna94__Item_Quantity__c=Qty  
                );
                cartItemList.add(item);
            }
        }
        insert cartItemList;
        if(cartItemToUpdate !=null && cartItemToUpdate.size() > 0)
        {
            update cartItemToUpdate;
        }   
    }
    @AuraEnabled
    public static String getCartId(List<String> beerList)
    {
        List<shatrughna94__Cart__c> cartList = getCart();
        if(cartList !=null && cartList.size()>0)
        {
            createCartItems(beerList,cartList[0].Id);
            return cartList[0].Id;
        }
        else
        {
            shatrughna94__Cart__c cart =new shatrughna94__Cart__c(shatrughna94__Coupon__c =getCoupon('BEER NEW')[0].Id,shatrughna94__Cart_Id__c=String.valueOf(Math.random()),shatrughna94__Cart_Status__c='Open',shatrughna94__Is_Active__c=true,shatrughna94__User__c=UserInfo.getUserId());
            insert cart;
            createCartItems(beerList,cart.Id); 
            return cart.Id;
        }
    }
    @TestVisible
    private static List<shatrughna94__Cart__c> getCart()
    {
        List<shatrughna94__Cart__c> cartList=[SELECT shatrughna94__Coupon_Applied__c, Id, Name FROM shatrughna94__Cart__c where shatrughna94__User__c=:UserInfo.getUserId() AND shatrughna94__Is_Active__c=true];
        System.debug('cartList in getCart--->'+cartList);
        return cartList;
    }
    @AuraEnabled
    public static Map<Id,shatrughna94__Cart_Item__c> getCartItems(String CartId)
    {
        /*if(CartId== null || CartId=='')
		CartId=getCartId();*/
        List<shatrughna94__Cart_Item__c> existingItemList=[Select id,name,shatrughna94__Item_Quantity__c,shatrughna94__Beer__r.Name,shatrughna94__Total_Amount__c,shatrughna94__Beer__c from shatrughna94__Cart_Item__c where shatrughna94__Cart__c=:CartId];
        Map<Id,shatrughna94__Cart_Item__c> beerQntyMap = new Map<Id,shatrughna94__Cart_Item__c>();
        for(shatrughna94__Cart_Item__c item:existingItemList)
        {
            if(!beerQntyMap.containsKey(item.shatrughna94__Beer__c))
            {
                beerQntyMap.put(item.shatrughna94__Beer__c,item);
            }
        }
        return beerQntyMap;
    }
    @AuraEnabled
    public static void deleteItem(String CartItemId){
        Database.delete(CartItemId);
    }
    
    @AuraEnabled
    public static String fetchAddressBook()
    {
        List<shatrughna94__Address_Book__c> addressList=[Select id,name,shatrughna94__Street__C,shatrughna94__State__C,
                                                         shatrughna94__City__C,shatrughna94__Country__C,shatrughna94__Postal_Code__C from shatrughna94__Address_Book__c
                                                         where shatrughna94__User__C =:userinfo.getUserId()];   
        System.debug(addressList.size()); 
        System.debug('Json.serialize(addressList);'+ Json.serialize(addressList)); 
        return Json.serialize(addressList);
        
    }
    @AuraEnabled
    public static String createOrder(String addressId,String cartId,String UserId, Decimal subtotal)
    {
        shatrughna94__Order__c order=new shatrughna94__Order__c(
            shatrughna94__Cart__c=cartId,
            shatrughna94__Shipping_Address__c=addressId,
            shatrughna94__User__c=UserId,
            shatrughna94__subtotal__c=subtotal	   
        );
        
        shatrughna94__Cart__c cart = new shatrughna94__Cart__c(Id=cartId,shatrughna94__Cart_Status__c='Closed',shatrughna94__Is_Active__c=False);
        update cart;
        insert order;
        shatrughna94__Order__c ord=[Select id,name from shatrughna94__Order__c where Id=:order.Id];
        return ord.Name+'####'+ord.id;
    }
}