----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.05.2022 14:46:57
-- Design Name: 
-- Module Name: InstructionMemory - Behavioral
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

entity InstructionMemory is
    Port ( Addr : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           DOUT : out STD_LOGIC_VECTOR (31 downto 0));
end InstructionMemory;

 architecture Behavioral of InstructionMemory is
    type memory is array (0 to 255) of STD_LOGIC_VECTOR (31 downto 0);
    signal mem : memory := ( x"00000000", x"06030200", x"06050400", x"00000000", x"00000000", x"00000000", X"05090500", X"06031000", x"00000000", x"00000000", x"00000000",  x"00000000", x"010a0305", x"08110300",  x"00000000",  x"00000000",  x"00000000",  x"070b1100", x"020c0305",  x"00000000",  x"00000000",  x"00000000", x"030d0c0a",  others => (X"05090500"));

begin
    
    process
    begin
        wait until CLK'event and CLK='1' ;
            DOUT <= mem(to_integer(unsigned(Addr))) ;
    
    end process;

end Behavioral;
