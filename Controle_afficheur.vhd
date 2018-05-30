LIBRARY IEEE ;
USE IEEE.STD_LOGIC_1164.ALL ;
USE IEEE.STD_LOGIC_unsigned.ALL ;
USE ieee.std_logic_1164.STD_LOGIC;

ENTITY controle_Afficheur IS 
PORT(
      CLK     : in Std_Logic ;
      Reset   : in Std_Logic ;
      enable  : in Std_Logic ;
      CA    : OUT std_logic;
      CB    : OUT std_logic; 
      CC    : OUT std_logic; 
      CD    : OUT std_logic;
      CE    : OUT std_logic;
      CF    : OUT std_logic;  
      CG    : OUT std_logic;
      AN0   : OUT std_logic;
      AN1   : OUT std_logic 
     );
END controle_Afficheur ;


ARCHITECTURE controle_Afficheur_arch OF controle_Afficheur IS 

COMPONENT DiviseurHF
PORT (
         Clk      : in Std_Logic ;
         Reset    : in Std_Logic ;
         ClkoutHF : out Std_Logic 
 );
 END COMPONENT;

COMPONENT Diviseur2
PORT (
         Clk    : in Std_Logic ;
         Reset  : in Std_Logic ;
         Clkout2 : out Std_Logic 
 );
 END COMPONENT;

COMPONENT Compteur9 
Port (
       clk     : in Std_Logic ;
       Reset   : in Std_Logic ;
       enable  : in Std_Logic ;
       OVF     : out std_logic ;
       C       : out Std_Logic_vector(3 downto 0) 
      ); 
END COMPONENT;

COMPONENT Compteur5 
Port (
       clk     : in Std_Logic ;
       Reset   : in Std_Logic ;
       enable  : in Std_Logic ;
       C       : out Std_Logic_vector(3 downto 0) 
      ); 
END COMPONENT;

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

COMPONENT selection_Afficheur 
port(
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

          AN0   : OUT std_logic;
          AN1   : OUT std_logic
	);
END COMPONENT;


  SIGNAL  Fc       : Std_Logic:='0';
  SIGNAL  Over_flow: Std_Logic:='0';
  SIGNAL  Count9   : Std_Logic_vector(3 downto 0):="0000";
  SIGNAL  Count5   : Std_Logic_vector(3 downto 0):="0000";
  SIGNAL  AN       : Std_Logic:='0';
  SIGNAL  HF       : Std_Logic:='0';

SIGNAL	A9 :Std_Logic:='0';
SIGNAL	B9 :Std_Logic:='0';
SIGNAL	C9 :Std_Logic:='0';
SIGNAL	D9 :Std_Logic:='0';
SIGNAL	E9 :Std_Logic:='0';
SIGNAL	F9 :Std_Logic:='0';
SIGNAL	G9 :Std_Logic:='0';

SIGNAL	A5 :Std_Logic:='0';
SIGNAL	B5 :Std_Logic:='0';
SIGNAL	C5 :Std_Logic:='0';
SIGNAL	D5 :Std_Logic:='0';
SIGNAL	E5 :Std_Logic:='0';
SIGNAL	F5 :Std_Logic:='0';
SIGNAL	G5 :Std_Logic:='0';

 
BEGIN     
instance : DiviseurHF
port map (
          CLK      => CLK , 
          Reset    => Reset,
          ClkoutHF => HF );

instance1 : Diviseur2
port map (
          CLK     => CLK , 
          Reset   => Reset,
          Clkout2 => Fc );

instance2 : Compteur5
port map (
          CLK    => Over_flow ,  
          Reset  => Reset,
          enable => enable,
          C      => Count5 );

instance3 : Compteur9
port map (
          CLK    => Fc ,  
          Reset  => Reset,
          enable => enable,
          OVF    => Over_flow,
          C      => Count9 );

instance4 : decodeur
port map ( 
          Clk => CLK,
          Reset => Reset,
          C  =>  Count9,
          CA => A9,
          CB => B9,
          CC => C9,
          CD => D9,
          CE => E9,
          CF => F9,
          CG => G9  
 );


instance5 : decodeur
port map ( 
          Clk => CLK,
          Reset => Reset,
          C  =>  Count5,
          CA => A5,
          CB => B5,
          CC => C5,
          CD => D5,
          CE => E5,
          CF => F5,
          CG => G5  
 );

instance6 : selection_Afficheur
port map (
          sel => HF,
          CA9 => A9,
          CB9 => B9,
          CC9 => C9,
          CD9 => D9,
          CE9 => E9,
          CF9 => F9,
          CG9 => G9,
          CA5 => A5,
          CB5 => B5,
          CC5 => C5,
          CD5 => D5,
          CE5 => E5,
          CF5 => F5,
          CG5 => G5,
          CA => CA,
          CB => CB,
          CC => CC,
          CD => CD,
          CE => CE,
          CF => CF,
          CG => CG,  
	  AN0 => AN0,
          AN1 => AN1
);
 

END controle_Afficheur_arch ;
