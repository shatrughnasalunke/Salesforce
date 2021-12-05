Public with sharing class actionpollerDemoController {
Public  Integer seconds{get;set;}

  Public actionpollerDemoController()
  {
       seconds = 0;
  }
  Public void CounterMethod()
  {
    seconds = seconds + 5;
  }
}