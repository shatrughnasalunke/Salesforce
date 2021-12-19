/**
 * An apex page controller that exposes the site login functionality
 */
@IsTest 
public with sharing class CommunitiesLoginControllerTest {
 
    @IsTest//(SeeAllData=true) 
    public  static void testCommunitiesLoginController () {
     	CommunitiesLoginController controller = new CommunitiesLoginController();
     	System.assertEquals(null, controller.forwardToAuthPage(),'Test Shatrughna');       
    }    
}