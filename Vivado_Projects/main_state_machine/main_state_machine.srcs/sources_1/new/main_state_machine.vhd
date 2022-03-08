----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.12.2021 21:30:10
-- Design Name: 
-- Module Name: main_state_machine - Behavioral
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

entity main_state_machine is
  Port (clk: in std_logic;
        uart_rx: in std_logic;
        baudrate: in std_logic;
        data: out std_logic_vector(0 to 7);
        valid: out std_logic);
end main_state_machine;

architecture Behavioral of main_state_machine is

type state_type is (IDLE, LSB, BIT1, BIT2, BIT3, BIT4, BIT5, BIT6, BIT7, STOP);
signal state: state_type;

begin

main_state: process(clk)
begin 
if rising_edge(clk) then
    case state is 
        when IDLE =>
            if uart_rx = '0' then state <= LSB; end if;
        when LSB =>          
            if baudrate = '1' then
            state <= BIT1;
            valid <= '1';
            data(7) <= uart_rx;
            else
            valid <= '0'; 
            end if;
        when BIT1 => 
            if baudrate = '1' then
            state <= BIT2;
            valid <= '1';
            data(6) <= uart_rx;
            else
            valid <= '0'; 
            end if;
        when BIT2 => 
            if baudrate = '1' then
            state <= BIT3;
            valid <= '1';
            data(5) <= uart_rx;
            else
            valid <= '0'; 
            end if;
        when BIT3 => 
            if baudrate = '1' then
            state <= BIT4;
            valid <= '1';
            data(4) <= uart_rx;
            else
            valid <= '0'; 
            end if;
        when BIT4 => 
            if baudrate = '1' then
            state <= BIT5;
            valid <= '1';
            data(3) <= uart_rx;
            else
            valid <= '0'; 
            end if;
        when BIT5 => 
            if baudrate = '1' then
            state <= BIT6;
            valid <= '1';
            data(2) <= uart_rx;
            else
            valid <= '0'; 
            end if;
        when BIT6 => 
            if baudrate = '1' then
            state <= BIT7;
            valid <= '1';
            data(1) <= uart_rx;
            else
            valid <= '0'; 
            end if;
        when BIT7 => 
            if baudrate = '1' then
            data(0) <= uart_rx;
            valid <= '1';
            state <= STOP;
            else
            valid <= '0'; 
            end if;
        when STOP => 
            if baudrate = '1' then
                data <= "00000000";
                valid <= '0';
                state <= IDLE;
             else
             valid <= '0';
            end if;                
        when others =>
            valid <= '0';
            state <= IDLE;
     end case;
 end if;
 end process main_state;

end Behavioral;
