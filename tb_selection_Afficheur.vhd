library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;


ENTITY tb_selection_Afficheur IS
END tb_selection_Afficheur ;

ARCHITECTURE tb_selection_Afficheur_arch OF tb_selection_Afficheur IS

COMPONENT selection_Afficheur is
PORT(
          sel    : IN std_logic;
	  CA9    : IN std_logic;
	  CB9    : IN std_logic;
	  CC9    : IN std_logic;
	  CD9    : IN std_logic;
	  CE9    : IN std_logic;
	  CF9    : IN std_logic;
	  CG9    : IN std_logic;
	  
	  CA5    : IN std_logic;
	  CB5    : IN std_logic;
	  CC5    : IN std_logic;
	  CD5    : IN std_logic;
	  CE5    : IN std_logic;
	  CF5    : IN std_logic;
	  CG5    : IN std_logic;
	  
	  CA     : OUT std_logic;
	  CB     : OUT std_logic;
	  CC     : OUT std_logic;
	  CD     : OUT std_logic;
	  CE     : OUT std_logic;
	  CF     : OUT std_logic;
	  CG     : OUT std_logic;
	  AN0     : OUT std_logic;
	  AN1     : OUT std_logic
	);
END COMPONENT;

  SIGNAL  sel      : Std_Logic:='0';
  SIGNAL  CA9      : std_logic:='0';
  SIGNAL  CB9      : std_logic:='0';
  SIGNAL  CC9      : std_logic:='0';
  SIGNAL  CD9      : std_logic:='0';
  SIGNAL  CE9      : std_logic:='0';
  SIGNAL  CF9      : std_logic:='0';
  SIGNAL  CG9      : std_logic:='0';
  SIGNAL  CA5      : std_logic:='0';
  SIGNAL  CB5      : std_logic:='0';
  SIGNAL  CC5      : std_logic:='0';
  SIGNAL  CD5      : std_logic:='0';
  SIGNAL  CE5      : std_logic:='0';
  SIGNAL  CF5      : std_logic:='0';
  SIGNAL  CG5      : std_logic:='0';
  SIGNAL  CA       : std_logic:='0';
  SIGNAL  CB       : std_logic:='0';
  SIGNAL  CC       : std_logic:='0';
  SIGNAL  CD       : std_logic:='0';
  SIGNAL  CE       : std_logic:='0';
  SIGNAL  CF       : std_logic:='0';
  SIGNAL  CG       : std_logic:='0';
  SIGNAL  AN0       : std_logic:='0';
  SIGNAL  AN1       : std_logic:='0'; 

BEGIN 
--Generation Clk
PROCESS
BEGIN 
sel<='1';
wait for 5 ns;
sel<='0'; 
wait for 5 ns;
END PROCESS;
--Generation ENTREE
process
begin
CA9 <='1';
CB9 <='1';
CC9 <='1';
CD9 <='1';
CE9 <='1';
CF9 <='1';
CG9 <='1';
    wait for 100 ns;
CA5 <='1';
CB5 <='0';
CC5 <='1';
CD5 <='0';
CE5 <='1';
CF5 <='0';
CG5 <='1';
    wait for 100 ns;
end process;

--Entite a tester
Inst_selection_Afficheur : selection_Afficheur
PORT MAP (
   sel      => sel     ,
  
   CA9     => CA9    ,
   CB9     => CB9    ,
   CC9     => CC9    ,
   CD9     => CD9    ,
   CE9     => CE9    ,
   CF9     => CF9    ,
   CG9     => CG9    ,

   CA5     => CA5    ,
   CB5     => CB5    ,
   CC5     => CC5    ,
   CD5     => CD5    ,
   CE5     => CE5    ,
   CF5     => CF5    ,
   CG5     => CG5    ,
           CA => CA,
          CB => CB,
          CC => CC,
          CD => CD,
          CE => CE,
          CF => CF,
          CG => CG,  
	  AN0     => AN0,
   AN1     => AN1 
	);
END tb_selection_Afficheur_arch;

