----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.05.2022 15:11:02
-- Design Name: 
-- Module Name: CPU - Behavioral
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

entity CPU is
    Port (  CLK : in STD_LOGIC;
            RST : in STD_LOGIC);
end CPU;    

architecture Behavioral of CPU is

    --ADD : 00000001
    --MUL : 00000010
    --SOU : 00000011
    --DIV : 00000100
    --COP : 00000101
    --AFC : 00000110
    --LOAD : 00000111
    --STORE : 00001000
    
    --Instruction Pointer
    signal ip : STD_LOGIC_VECTOR (7 downto 0);
    
    --RegisterBench
    signal Addr_A, Addr_B, Addr_W : STD_LOGIC_VECTOR (3 downto 0);
    signal W : STD_LOGIC;
    signal QA, QB, DATA_Bench : STD_LOGIC_VECTOR (7 downto 0);
    
    --DataMemory
    signal Addr_DataMem, DIN_DataMem, DOUT_DataMem : STD_LOGIC_VECTOR (7 downto 0);
    signal RW : STD_LOGIC;
    
    --InstructionMemory
    signal Addr_InstMem : STD_LOGIC_VECTOR (7 downto 0);
    signal DOUT_InstMem : STD_LOGIC_VECTOR (31 downto 0);
    
    --ALU
    signal N, O, Z, C :STD_LOGIC;
    signal A, B, S : STD_LOGIC_VECTOR (7 downto 0);
    signal Ctrl_Alu : STD_LOGIC_VECTOR (2 downto 0);
    
    --Pipeline
    signal A1IN, A1OUT, A2IN, A2OUT, A3IN, A3OUT, A4IN, A4OUT : STD_LOGIC_VECTOR (7 downto 0);
    signal OP1IN, OP1OUT, OP2IN, OP2OUT, OP3IN, OP3OUT, OP4IN, OP4OUT : STD_LOGIC_VECTOR (7 downto 0);
    signal B1IN, B1OUT, B2IN, B2OUT, B3IN, B3OUT, B4IN, B4OUT : STD_LOGIC_VECTOR (7 downto 0);
    signal C1IN, C1OUT, C2IN, C2OUT, C3IN, C3OUT, C4IN, C4OUT : STD_LOGIC_VECTOR (7 downto 0);
    
    component BancRegistre 
        Port ( Addr_A : in STD_LOGIC_VECTOR (3 downto 0);
               Addr_B : in STD_LOGIC_VECTOR (3 downto 0);
               Addr_W : in STD_LOGIC_VECTOR (3 downto 0);
               W : in STD_LOGIC;
               DATA : in STD_LOGIC_VECTOR (7 downto 0);
               RST : in STD_LOGIC;
               CLK : in STD_LOGIC;
               QA : out STD_LOGIC_VECTOR (7 downto 0);
               QB : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    component DataMemory
        Port ( Addr : in STD_LOGIC_VECTOR (7 downto 0);
               DIN : in STD_LOGIC_VECTOR (7 downto 0);
               RW : in STD_LOGIC;
               RST : in STD_LOGIC;
               CLK : in STD_LOGIC;
               DOUT : out STD_LOGIC_VECTOR (7 downto 0));   
    end component;
    
    component InstructionMemory
        Port ( Addr : in STD_LOGIC_VECTOR (7 downto 0);
               CLK : in STD_LOGIC;
               DOUT : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component ALU
        Port ( N : out STD_LOGIC;
               O : out STD_LOGIC;
               Z : out STD_LOGIC;
               C : out STD_LOGIC;
               A : in STD_LOGIC_VECTOR (7 downto 0);
               B : in STD_LOGIC_VECTOR (7 downto 0);
               S : out STD_LOGIC_VECTOR (7 downto 0);
               Ctrl_Alu : in STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component Pipeline
        Port ( CLK :  in STD_LOGIC;
               A_IN : in STD_LOGIC_VECTOR (7 downto 0);
               OP_IN : in STD_LOGIC_VECTOR (7 downto 0);
               B_IN : in STD_LOGIC_VECTOR (7 downto 0);
               C_IN : in STD_LOGIC_VECTOR (7 downto 0);
               A_OUT : out STD_LOGIC_VECTOR (7 downto 0);
               B_OUT : out STD_LOGIC_VECTOR (7 downto 0);
               OP_OUT : out STD_LOGIC_VECTOR (7 downto 0);
               C_OUT : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

begin

    instructMemory : InstructionMemory port map(
        Addr => Addr_InstMem,
        CLK => CLK,
        DOUT => DOUT_InstMem);
    
    regBench : BancRegistre port map (
        Addr_A => Addr_A,
        Addr_B => Addr_B,
        Addr_W => Addr_W,
        W => W,
        DATA => DATA_Bench,
        RST => RST,
        CLK => CLK,
        QA => QA,
        QB => QB);
        
    dataMem : DataMemory port map (
        Addr => Addr_DataMem,
        DIN => DIN_DataMem,
        RW => RW,
        RST => RST,
        CLK => CLK,
        DOUT => DOUT_DataMem
    );
    
    UAL : ALU port map (
        N => N,
        O => O,
        Z => Z,
        A => A,
        B => B,
        S => S, 
        Ctrl_Alu => Ctrl_Alu
    );
    
    pipeLIDI : Pipeline port map (
        CLK => CLK,
        A_IN => A1IN,
        OP_IN => OP1IN,
        B_IN => B1IN,
        C_IN => C1IN,
        A_OUT => A1OUT,
        B_OUT => B1OUT,
        OP_OUT => OP1OUT,
        C_OUT => C1OUT
    );
    
    pipeDIEX : Pipeline port map (
        CLK => CLK,
        A_IN => A2IN,
        OP_IN => OP2IN,
        B_IN => B2IN,
        C_IN => C2IN,
        A_OUT => A2OUT,
        B_OUT => B2OUT,
        OP_OUT => OP2OUT,
        C_OUT => C2OUT
    );
        
    pipeEXMEM : Pipeline port map (
        CLK => CLK,
        A_IN => A3IN,
        OP_IN => OP3IN,
        B_IN => B3IN,
        C_IN => C3IN,
        A_OUT => A3OUT,
        B_OUT => B3OUT,
        OP_OUT => OP3OUT,
        C_OUT => C3OUT
    );
    
    pipeMEMRE : Pipeline port map (
        CLK => CLK,
        A_IN => A4IN,
        OP_IN => OP4IN,
        B_IN => B4IN,
        C_IN => C4IN,
        A_OUT => A4OUT,
        B_OUT => B4OUT,
        OP_OUT => OP4OUT,
        C_OUT => C4OUT
    );
    
    --Compteur de bits
    process
        begin
            wait until CLK'event and CLK='1';
            if (RST = '1') then
                ip <= "00000000";
            else
                ip <= ip + 1;
            end if;
    end process;
    
    --Mémoire des instructions
    Addr_InstMem <= ip;
    --1er pipeline
    C1IN <= DOUT_InstMem(7 downto 0);
    B1IN <= DOUT_InstMem(15 downto 8);
    A1IN <= DOUT_InstMem(23 downto 16);
    OP1IN   <= DOUT_InstMem(31 downto 24);
    
    --Banc de registre
    Addr_A <= B1OUT(3 downto 0) ;  
    Addr_B <= C1OUT(3 downto 0) ;  
    --Si STORE on écrit pas
    --Sinon on écrit
    W <=    '1' when OP4OUT = x"01" or OP4OUT = x"02" or OP4OUT = x"03" or OP4OUT = x"04" or OP4OUT = x"05" or OP4OUT = x"06" or OP4OUT = x"07" else
            '0';
    Addr_W <= A4OUT(3 downto 0);
    DATA_Bench <= B4OUT ;
    
    --2ème pipeline
    A2IN <= A1OUT ;
    OP2IN <= OP1OUT ;
    --Si AFC ou LOAD on propage B
    --Si COP, ADD, MUL, DIV, SOU ou STORE on propage QA
    B2IN <= B1OUT when OP1OUT = "00000110"
                    or OP1OUT = "00000111" else
            QA;
    C2IN <= QB;
    
    --UAL
    A <= B2OUT;
    B <= C2OUT;
    --Si ADD, MUL, DIV ou SOU on propage OP
    Ctrl_Alu <= OP2OUT(2 downto 0) when OP2OUT = "00000001"
                                     or OP2OUT = "00000010"
                                     or OP2OUT = "00000011"
                                     or OP2OUT = "00000100";
    
    --3ème pipeline
    A3IN <= A2OUT ;
    OP3IN <= OP2OUT ;
    --Si AFC, COP, LOAD ou STORE on propage B
    --Si ADD, MUL, DIV ou SOU on progage S
    B3IN <= B2OUT when OP2OUT = "00000110" 
                    or OP2OUT = "00000101" 
                    or OP2OUT = "00000111" 
                    or OP2OUT = "00001000" else
            S;
            
    --Mémoire des données
    --Si STORE on propage A
    --Sinon B
    Addr_DataMem <= A3OUT when OP3OUT = "00001000" else
                    B3OUT;
    --Si STORE on met B
    DIN_DataMem <=  B3OUT when OP3OUT = "00001000";
    --Si LOAD on lit dans DataMem
    --Sinon non
    RW <=   '1' when OP3OUT = x"08" else
            '0';
    
    --4ème pipeline
    A4IN <= A3OUT ;
    OP4IN <= OP3OUT ;
    --Si LOAD on propage DOUT
    --Si AFC, COP, ADD, MUL, DIV ou SOU on propage B
    B4IN <=     DOUT_DataMem when OP3OUT = "00000111" else
                B3OUT;           
       
           
end Behavioral;