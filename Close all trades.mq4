//-------------------------------------------------------------------------------------------------
// Name: Close all trades.mq4
// Type: Script
// © AlphaOne-FX, 2020
//-------------------------------------------------------------------------------------------------
void OnStart()                   // Special function OnStart
{                                        
   while(OrdersTotal() > 0)      // Test for any active trades 
   {
      for(int i = 0; i < OrdersTotal(); i++)          // Iterate through orders
      {          
         if(OrderSelect(i, SELECT_BY_POS) == true)    // Selecting each order
         {
            // Closing selected order
            OrderClose(OrderTicket(),OrderLots(),OrderClosePrice(),10,NULL);
         }
      }
      Sleep(500);
    }
    
    Alert("All trades are closed");       // Alert message
    Alert("");                            // Empty Line (Gap)   
    return;                               // Exit OnStart
}