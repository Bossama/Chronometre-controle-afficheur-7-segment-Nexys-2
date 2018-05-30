library IEEE;
use IEEE.std_logic_1164.all;

ENTITY Decodeur IS 
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
END Decodeur ;

ARCHITECTURE Decodeur_arch OF Decodeur IS 
BEGIN
Process(Clk,Reset,C)
begin 
if (reset='1')
   then CA  <= '0';
        CB  <= '0';
        CC  <= '0';
        CD  <= '0';
        CE  <= '0';
        CF  <= '0';
        CG  <= '1';

 elsif clk'event and clk='1'
   then   
   if C <= "0000" then CA<='0'; CB<='0'; CC<='0'; CD<='0'; CE<='0'; CF<='0'; CG<='1';
elsif C <= "0001" then CA<='1'; CB<='0'; CC<='0'; CD<='1'; CE<='1'; CF<='1'; CG<='1';
elsif C <= "0010" then CA<='0'; CB<='0'; CC<='1'; CD<='0'; CE<='0'; CF<='1'; CG<='0';
elsif C <= "0011" then CA<='0'; CB<='0'; CC<='0'; CD<='0'; CE<='1'; CF<='1'; CG<='0';
elsif C <= "0100" then CA<='1'; CB<='0'; CC<='0'; CD<='1'; CE<='1'; CF<='0'; CG<='0';
elsif C <= "0101" then CA<='0'; CB<='1'; CC<='0'; CD<='0'; CE<='1'; CF<='0'; CG<='0';
elsif C <= "0110" then CA<='0'; CB<='1'; CC<='0'; CD<='0'; CE<='0'; CF<='0'; CG<='0';
elsif C <= "0111" then CA<='0'; CB<='0'; CC<='0'; CD<='1'; CE<='1'; CF<='1'; CG<='1';
elsif C <= "1000" then CA<='0'; CB<='0'; CC<='0'; CD<='0'; CE<='0'; CF<='0'; CG<='0';
elsif C <= "1001" then CA<='0'; CB<='0'; CC<='0'; CD<='0'; CE<='1'; CF<='0'; CG<='0';

 else   CA  <= '0';
        CB  <= '0';
        CC  <= '0';
        CD  <= '0';
        CE  <= '0';
        CF  <= '0';
        CG  <= '1';
end if ; 
end if ;
end process ;

end Decodeur_arch ;

