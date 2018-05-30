
LIBRARY IEEE ;
USE IEEE.STD_LOGIC_1164.ALL ;
ENTITY tb_diviseur IS
END tb_diviseur ;

ARCHITECTURE tb_diviseur_arch OF tb_diviseur IS

COMPONENT Diviseur
PORT (
         Clk    : in Std_Logic ;
         Reset  : in Std_Logic ;
         Clkout : out Std_Logic 
 );
 END COMPONENT;
 
SIGNAL Clk      : Std_Logic:='0' ;
SIGNAL Reset    : Std_Logic:='0' ;
SIGNAL Clkout   : Std_Logic:='0' ;

BEGIN
 Stimuli_Reset : PROCESS
BEGIN
Reset<='1';
wait for 100 ns;
Reset<='0';
wait;
END PROCESS Stimuli_Reset ;

Stimuli_Clk : PROCESS
BEGIN
clk<='1';
wait for 10 ns;
clk<='0';
wait for 10 ns;
END PROCESS Stimuli_Clk ;

Instance : Diviseur
 PORT MAP ( 
              Clk => Clk,
              Reset => Reset,
              Clkout => Clkout
              );
    
 END tb_diviseur_arch; 