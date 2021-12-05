public class TestDataCode
{
    Public  void getData()
    {
        String[] s1 = new String[] {'File1','File2','File3','File4','File5'}; 
        String[] s2  =new String[] {'File1','File2','File3','File4'}; 
        Integer count=0; 
        Integer count2=0 ;
        for(String firststring :S1)
        { 
            for(String secodnstring:s2)
            {
                if(secodnstring.equals(firststring))
                {
                }  
                if(!secodnstring.equals(firststring))
                {
                    System.debug(firststring);
                }
            }
        }
    }
}