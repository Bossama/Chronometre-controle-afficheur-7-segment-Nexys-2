LIBRARY IEEE ;
USE IEEE.STD_LOGIC_1164.ALL ;
ENTITY tb_Compteur9 IS
END tb_Compteur9;

ARCHITECTURE Test OF tb_Compteur9 IS 

COMPONENT Compteur9 
Port (
       clk     : in Std_Logic ;
       Reset   : in Std_Logic ;
       enable  : in Std_Logic ;
       C       : out Std_Logic_vector(3 downto 0) ;
       OVF     : out Std_Logic 
      ); 
END COMPONENT;

SIGNAL clk     : Std_Logic:='0' ;
SIGNAL Reset   : Std_Logic:='0' ;
SIGNAL enable  : Std_Logic:='0' ;
SIGNAL C       : Std_Logic_vector(3 downto 0):="0000";
SIGNAL OVF     : Std_Logic:='0' ;

BEGIN 
--Generation Clk
PROCESS
BEGIN 
clk<='1';
wait for 5 ns;
clk<='0'; 
wait for 5 ns;
END PROCESS;
--Generation Reset 
PROCESS
BEGIN
Reset<='1';
wait for 100 ns;
Reset<='0';
wait;
END PROCESS;
--Generation enable
PROCESS
BEGIN
enable<='1';
wait for 150 ns;
enable<='0';
wait for 170 ns;
enable<='1';
wait;
END PROCESS;
--Entite a tester
Inst_Compteur : Compteur9
PORT MAP (
	clk=>clk,
	reset=>reset,
	enable=>enable,
	C=>C,
        OVF=>OVF
	);
END Test;

  
