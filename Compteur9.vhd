LIBRARY IEEE ;
USE IEEE.STD_LOGIC_1164.ALL ;
USE IEEE.STD_LOGIC_unsigned.ALL ;

ENTITY Compteur9 IS 
PORT(
      CLK     : in Std_Logic ;
      Reset   : in Std_Logic ;
      enable  : in Std_Logic ;
      C       : out std_Logic_vector(3 downto 0) ;
      OVF     : out std_logic
     );
END Compteur9 ;

ARCHITECTURE Compteur9_arch OF Compteur9 IS 
signal var : std_Logic_vector(4-1 downto 0);
BEGIN
Process(clk,reset,enable)
begin 
if (reset='1') then var<="0000"; OVF<='0';

 elsif clk'event and clk='1'
   then if enable='1'
           then var<=var+"0001" ; OVF <= '0';
             if var = "1001" then var <="0000" ; OVF <= '1'; end if;
         end if;
end if;
end process;
C<=var;
END Compteur9_arch ;
