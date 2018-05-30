LIBRARY IEEE ;
USE IEEE.STD_LOGIC_1164.ALL ;
USE IEEE.STD_LOGIC_unsigned.ALL ;

ENTITY DiviseurHF IS 
PORT(
      CLK       : in Std_Logic ;
      Reset     : in Std_Logic ;
      ClkoutHF  : out std_Logic
    );
END DiviseurHF ;

ARCHITECTURE DiviseurHF_arch OF DiviseurHF IS 
signal CD : std_Logic_vector(5 downto 0);
signal H  : std_Logic ; 
BEGIN
Process(clk,reset)
begin 
if reset='1'
   then CD <="000000" ; 
         H <='0' ;
                
 elsif clk'event and clk='1'
   then if CD = "111111"
          then CD <= "000000"; H <=not H;
            else CD <= CD + "000001" ;
 end if;
end if;
end process;
ClkoutHF <= H ; 
END DiviseurHF_arch ;
