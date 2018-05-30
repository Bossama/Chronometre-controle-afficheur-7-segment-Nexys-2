LIBRARY IEEE ;
USE IEEE.STD_LOGIC_1164.ALL ;
USE IEEE.STD_LOGIC_unsigned.ALL ;

ENTITY Diviseur2 IS 
PORT(
      CLK     : in Std_Logic ;
      Reset   : in Std_Logic ;
      Clkout2  : out std_Logic
    );
END Diviseur2 ;

ARCHITECTURE Diviseur2_arch OF Diviseur2 IS 
signal CD : std_Logic_vector(2 downto 0);
signal H  : std_Logic ; 
BEGIN
Process(clk,reset)
begin 
if reset='1'
   then CD <="000" ; 
         H <='0' ;
                
 elsif clk'event and clk='1'
   then if CD = "100"
          then CD <= "000"; H <=not H;
            else CD <= CD + "001" ;
 end if;
end if;
end process;
Clkout2 <= H ; 
END Diviseur2_arch ;


