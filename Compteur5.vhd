LIBRARY IEEE ;
USE IEEE.STD_LOGIC_1164.ALL ;
USE IEEE.STD_LOGIC_unsigned.ALL ;

ENTITY Compteur5 IS 
PORT(
      CLK     : in Std_Logic ;
      Reset   : in Std_Logic ;
      enable  : in Std_Logic ;
      C       : out std_Logic_vector(3 downto 0)
     );
END Compteur5 ;

ARCHITECTURE Compteur5_arch OF Compteur5 IS 
signal var : std_Logic_vector(3 downto 0);
BEGIN
Process(clk,reset,enable)
begin 
if (reset='1')
   then var<="0000";
 elsif clk'event and clk='1'
   then if enable='1'
           then var<=var+"0001";
             if var = "0101" then var <="0000"; end if;
         end if;
end if;
end process;
C<=var;
END Compteur5_arch;
