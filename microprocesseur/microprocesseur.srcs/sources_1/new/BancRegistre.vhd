----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.05.2022 13:58:55
-- Design Name: 
-- Module Name: BancRegistre - Behavioral
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

entity BancRegistre is
    Port ( Addr_A : in STD_LOGIC_VECTOR (3 downto 0);
           Addr_B : in STD_LOGIC_VECTOR (3 downto 0);
           Addr_W : in STD_LOGIC_VECTOR (3 downto 0);
           W : in STD_LOGIC;
           DATA : in STD_LOGIC_VECTOR (7 downto 0);
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           QA : out STD_LOGIC_VECTOR (7 downto 0);
           QB : out STD_LOGIC_VECTOR (7 downto 0));
end BancRegistre;

architecture Behavioral of BancRegistre is
    type registers is array (15 downto 0) of STD_LOGIC_VECTOR (7 downto 0);
    signal reg : registers;

begin
    process
    begin
        wait until CLK'event and CLK='1' ;
            if (RST='0') then reg <= (others => X"00"); 
            end if;
            
            if (W = '1') then 
                reg(to_integer(unsigned(Addr_W))) <= DATA;       
            end if;   
    end process;
    QA <= reg(to_integer(unsigned(Addr_A))) when W = '0' or Addr_W /= Addr_A else DATA;
    QB <= reg(to_integer(unsigned(Addr_B))) when W = '0' or Addr_W /= Addr_B else DATA ;

end Behavioral;
