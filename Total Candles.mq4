//-------------------------------------------------------------------------------------------------
// Name: Total Candles.mq4
// Type: Script
// © AlphaOne-FX, 2020
//-------------------------------------------------------------------------------------------------
void OnStart()                            // Special function OnStart
  {
   Alert("");                             // Empty Line (Gap)
   Alert("Total Candles = ", iBars(0,0)); // Counts total number of candles
   return;                                // Exit OnStart
  }