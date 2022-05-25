----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.05.2022 12:01:54
-- Design Name: 
-- Module Name: CPU_Sim - Behavioral
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CPU_Sim is
--  Port ( );
end CPU_Sim;

architecture Behavioral of CPU_Sim is
    signal CLK, RST : STD_LOGIC;
    
    component CPU
        Port (  CLK :  in STD_LOGIC;
                RST : in STD_LOGIC);
    end component;

begin

    process
        begin
        wait for 10ns;
        if CLK = '0' then
            CLK <= '1';
        else
            CLK <= '0';
        end if;
        
    end process;
    
    process
        begin
        wait for 100ns;
        RST <= '1';
        wait for 20ns;
        RST <= '0';
        wait for 1000000ns;
    end process;


end Behavioral;
