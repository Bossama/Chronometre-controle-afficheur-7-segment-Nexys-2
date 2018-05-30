LIBRARY IEEE ;
USE IEEE.STD_LOGIC_1164.ALL ;


ENTITY tb_decodeur IS
END tb_decodeur;

ARCHITECTURE tb_decodeur_arch OF tb_decodeur IS 
COMPONENT decodeur 
PORT(
      Clk     : in Std_Logic ;
      Reset   : in Std_Logic ;
      C       : in std_Logic_vector(3 downto 0);
      CA      : out std_logic;
      CB      : out std_logic;
      CC      : out std_logic;
      CD      : out std_logic;
      CE      : out std_logic;
      CF      : out std_logic;
      CG      : out std_logic
      );
END COMPONENT;

  SIGNAL  clk     : Std_Logic:='0';
  SIGNAL  Reset   : Std_Logic:='0';
  SIGNAL  C       : Std_Logic_vector(3 downto 0):="0000";
  SIGNAL  CA      : std_logic:='0';
  SIGNAL  CB      : std_logic:='0';
  SIGNAL  CC      : std_logic:='0';
  SIGNAL  CD      : std_logic:='0';
  SIGNAL  CE      : std_logic:='0';
  SIGNAL  CF      : std_logic:='0';
  SIGNAL  CG      : std_logic:='0';

BEGIN 
--Generation Clk
Stimuli_Clk:PROCESS
BEGIN 
clk<='1';
wait for 10 ns;
clk<='0'; 
wait for 10 ns;
END PROCESS;
--Generation Reset 
 Stimuli_Reset:PROCESS
BEGIN
Reset<='1';
wait for 50 ns;
Reset<='0';
wait;
END PROCESS;
--Generation C
Stimuli_C:PROCESS
BEGIN
C <= "0000";
wait for 50 ns;
C <= "0001";
wait for 50 ns;
C <= "0010";
wait for 50 ns;
C <= "0011";
wait for 50 ns;
C <= "0100";
wait for 50 ns;
C <= "0101";
wait for 50 ns;
C <= "0110";
wait for 50 ns;
C <= "0111";
wait for 50 ns;
C <= "1000";
wait for 50 ns;
C <= "1001";
wait for 50 ns;
wait;
END PROCESS;

--Entite a tester
Inst_decodeur : decodeur
PORT MAP (
   clk     => clk   ,
   Reset   => Reset ,
   C       => C     ,
   CA      => CA    ,
   CB      => CB    ,
   CC      => CC    ,
   CD      => CD    ,
   CE      => CE    ,
   CF      => CF    ,
   CG      => CG    
	);
END tb_decodeur_arch;

