//-------------------------------------------------------------------------------------------------
// EMA Crossover.mq4
// TYPE: EA
// © AlphaOne-FX, 2020
//-------------------------------------------------------------------------------------------------
datetime currtime = iTime(NULL,0,0);      // Initialising variable
double EMA_fast_value, EMA_slow_value;    // EMA values
int direction;

input int EMA_fast = 10;                  // User input for Fast EMA          
input int EMA_slow = 20;                  // User input for Slow EMA

void OnInit()
{
   EMA_fast_value = iMA(Symbol(),0,EMA_fast,0,1,0,0);   // Initial value
   EMA_slow_value = iMA(Symbol(),0,EMA_slow,0,1,0,0);   // Initial value
   
   if (EMA_fast_value > EMA_slow_value)
   {
      direction = 1;              // Initial direction is BUY
   }
   else
   {
      direction = 0;              // Initial direction is SELL
   }
   
   return;
}
            
void OnTick()                             // Special function OnTick()    
{                                                
   if(currtime != iTime(NULL,0,0))        // New candle has started
   {  
      EMA_fast_value = iMA(Symbol(),0,EMA_fast,0,1,0,1);   // Current value
      EMA_slow_value = iMA(Symbol(),0,EMA_slow,0,1,0,1);   // Current value
                  
      if ((EMA_fast_value > EMA_slow_value) && direction == 1)       // X-over to BUY direction
      {
         Alert("Buy Trades Only: ", Symbol());     // Alert message
         direction = 0;                            // Updating direction
      }
      else if ((EMA_fast_value < EMA_slow_value) && direction == 0)  // X-over to SELL direction
      {
         Alert("Sell Trades Only: ", Symbol());    // Alert message
         direction = 1;                            // Updating direction
      }
      
      currtime = iTime(NULL,0,0);         // Resetting variable
   }
   return;                                // Exit OnTick()
}                                               
