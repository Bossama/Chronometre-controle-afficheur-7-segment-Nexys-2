
LIBRARY IEEE ;
USE IEEE.STD_LOGIC_1164.ALL ;
ENTITY tb_Compteur5 IS
END tb_Compteur5;

ARCHITECTURE Test OF tb_Compteur5 IS 

COMPONENT Compteur5 
Port (
       clk     : in Std_Logic ;
       Reset   : in Std_Logic ;
       enable  : in Std_Logic ;
       C       : out Std_Logic_vector(3 downto 0) 
      ); 
END COMPONENT;

SIGNAL clk     : Std_Logic:='0' ;
SIGNAL Reset   : Std_Logic:='0' ;
SIGNAL enable  : Std_Logic:='0' ;
SIGNAL C       : Std_Logic_vector(3 downto 0):="0000";

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
Inst_Compteur : Compteur5
PORT MAP (
	clk=>clk,
	reset=>reset,
	enable=>enable,
        C=>C
	);
END Test;