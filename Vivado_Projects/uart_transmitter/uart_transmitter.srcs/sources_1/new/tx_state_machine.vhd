----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.12.2021 23:03:17
-- Design Name: 
-- Module Name: tx_state_machine - Behavioral
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

entity tx_state_machine is
  Port (clk: in std_logic;
        valid: in std_logic;
        baudrate_out: in std_logic;
        data: in std_logic_vector(7 downto 0);
        busy: out std_logic;
        uart_tx: out std_logic);
end tx_state_machine;

architecture Behavioral of tx_state_machine is

type state_type is (IDLE, DATA_VALID, START, LSB, BIT1, BIT2, BIT3, BIT4, BIT5, BIT6, BIT7, STOP);
signal state: state_type;


begin

tx_state: process(clk)

variable data_cp: std_logic_vector(7 downto 0) := "00000000";

begin
if rising_edge(clk) then
    case state is
        when IDLE => 
            busy <= '0';
            if valid = '1' then
                state <= DATA_VALID;
                busy <= '1';
                data_cp := data;
            end if;
        when DATA_VALID => 
            if baudrate_out = '1' then
                uart_tx <= '0';
                state <= START;                
            end if; 
        when START => 
            if baudrate_out = '1' then
                uart_tx <= data_cp(0);
                state <= LSB;
            end if; 
        when LSB => 
            if baudrate_out = '1' then
                uart_tx <= data_cp(1);
                state <= BIT1;
            end if; 
         when BIT1 => 
            if baudrate_out = '1' then
                uart_tx <= data_cp(2);
                state <= BIT2;
            end if;
         when BIT2 => 
            if baudrate_out = '1' then
                uart_tx <= data_cp(3);
                state <= BIT3;
            end if;
         when BIT3 => 
            if baudrate_out = '1' then
                uart_tx <= data_cp(4);
                state <= BIT4;
            end if;
         when BIT4 => 
            if baudrate_out = '1' then
                uart_tx <= data_cp(5);
                state <= BIT5;
            end if;
         when BIT5 => 
            if baudrate_out = '1' then
                uart_tx <= data_cp(6);
                state <= BIT6;
            end if;
         when BIT6 => 
            if baudrate_out = '1' then
                uart_tx <= data_cp(7);
                state <= BIT7;
            end if;
         when BIT7 => 
            if baudrate_out = '1' then
                uart_tx <= '1';
                state <= STOP;
            end if;
        when STOP =>
            if baudrate_out = '1' then              
                state <= IDLE;
            end if;
        when others => 
            state <= IDLE;
    end case;
end if;
end process;

end Behavioral;
