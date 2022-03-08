----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.12.2021 12:15:16
-- Design Name: 
-- Module Name: sampler_state_machine - Behavioral
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

entity sampler_state_machine is
  Port (clk: in std_logic;
        uart_rx: in std_logic;
        pulse_out: in std_logic;
        enable: out std_logic);
end sampler_state_machine;

architecture Behavioral of sampler_state_machine is

type state_type is (IDLE, START, LSB, BIT1, BIT2, BIT3, BIT4, BIT5, BIT6, BIT7, STOP);
signal state: state_type;

begin 

sampler_state: process(clk)
begin 
if rising_edge(clk) then
    case state is 
        when IDLE =>
            enable <= '0';
            if uart_rx = '0' then state <= START; end if;
        when START => 
            enable <= '1';
            if pulse_out = '1' then state <= LSB; end if;
        when LSB =>
            enable <= '1';
            if pulse_out = '1' then state <= BIT1; end if;
        when BIT1 => 
            enable <= '1';
            if pulse_out = '1' then state <= BIT2; end if;
        when BIT2 => 
            enable <= '1';
            if pulse_out = '1' then state <= BIT3; end if;
        when BIT3 => 
            enable <= '1';
            if pulse_out = '1' then state <= BIT4; end if;
        when BIT4 => 
            enable <= '1';
            if pulse_out = '1' then state <= BIT5; end if;
        when BIT5 => 
            enable <= '1';
            if pulse_out = '1' then state <= BIT6; end if;
        when BIT6 => 
            enable <= '1';
            if pulse_out = '1' then state <= BIT7; end if;
        when BIT7 => 
            enable <= '1';
            if pulse_out = '1' then state <= STOP; end if;
        when STOP => 
            enable <= '0';
            state <= IDLE;
        when others =>
            enable <= '0';
            state <= IDLE;
     end case;
 end if;
 end process sampler_state;

end Behavioral;
