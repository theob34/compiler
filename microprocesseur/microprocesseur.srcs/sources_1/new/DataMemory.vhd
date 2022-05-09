----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.05.2022 14:45:12
-- Design Name: 
-- Module Name: DataMemory - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DataMemory is
    Port ( Addr : in STD_LOGIC_VECTOR (7 downto 0);
           DIN : in STD_LOGIC_VECTOR (7 downto 0);
           RW : in STD_LOGIC;
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           DOUT : out STD_LOGIC_VECTOR (7 downto 0));
end DataMemory;

architecture Behavioral of DataMemory is
    type memory is array (15 downto 0) of STD_LOGIC_VECTOR (7 downto 0);
    signal mem : memory;

begin
    process
    begin
        wait until CLK'event and CLK='1' ;
            --reset
            if (RST='0') then mem <= (others => X"00");
            end if;
            
            --lecture
            if (RW = '1') then 
                DOUT <= mem(to_integer(unsigned(Addr))) ;
            --eciture
            elsif (RW = '0') then 
                mem(to_integer(unsigned(Addr))) <= DIN; 
            end if ;   
    end process ;

end Behavioral;
