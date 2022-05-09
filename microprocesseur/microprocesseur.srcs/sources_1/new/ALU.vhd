----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.05.2022 12:56:17
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
    Port ( N : out STD_LOGIC;
           O : out STD_LOGIC;
           Z : out STD_LOGIC;
           C : out STD_LOGIC;
           A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           S : out STD_LOGIC_VECTOR (7 downto 0);
           Ctrl_Alu : in STD_LOGIC_VECTOR (2 downto 0));
end ALU;

architecture Behavioral of ALU is

signal S_ADD : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
signal S_MUL : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
signal S_DIV : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
signal S_SUB : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
signal S_AUX : STD_LOGIC_VECTOR (7 downto 0) := "00000000";

begin

    S_ADD <= ('0'&A) + ('0'&B);
    S_SUB <= ('0'&A) - ('0'&B);
    S_MUL <= A*B;
    --    -S_DIV <= ;

            
    S_AUX <=    S_ADD when (Ctrl_Alu = "00") else
                S_SUB when (Ctrl_Alu = "01") else
                S_MUL when (Ctrl_Alu = "10") else
               -- S_DIV() when op = (Ctrl_Alu = "11") else
               "00000000" ;
                
    S <= S_AUX;
    
    C <=    '1' when (('0'&A) + ('0'&B) > 255) else
            '0' ;
    O <=    '1' when (('0'&A) + ('0'&B) > 255) else
            '1' when (A*B > 255) else
            '0' ;
    Z <=    '1' when (S_AUX = 0) else
            '0' ;
    N <=    '1' when (('0'&A) - ('0'&B) < 0) else
            '0' ;

end Behavioral;
