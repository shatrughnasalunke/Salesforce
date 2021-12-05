public class Find_Missing_String 
    {
        public static String[] missing_Words()
        {
          String str1 = 'Java Programming Exercises,';
          String str2 = 'Java Programming ';
          String[] s1 = str1.split('');
          String[] s2 = str2.split('');
          Integer sz=str1.length()-str2.length();
          List<String> missing_str=new List<String>();
          Integer c = 0;
            for (Integer i = 0; i < s1.Size(); i++) 
            {
                Integer flag=0;
                for (Integer j = 0; j < s2.Size(); j++)
                { 
                    if (s1[i].equals(s2[j]))
                    { 
                        flag = 1;
                    }
                    if (flag == 0) 
                    {
                       missing_str.add(s1[i]);
                    }
                }
            }
            System.debug(missing_str);
            return missing_str;
         }
    }