library ieee;
use ieee.std_logic_1164.all;

entity tb_dff is

end tb_dff;


architecture Behavioral of tb_dff is

component dff is
    port (
        clk : in std_logic;
        rst : in std_logic;
        d : in std_logic;
        q : out std_logic);
end component;

signal clk,rst : std_logic; signal d: std_logic; signal q: std_logic; 

begin 

uut: dff port map (clk=> clk, rst=> rst, d=> d, q=> q);

p_clk: process
begin 
    clk<='0'; wait for 5 ns; clk<='1'; wait for 5 ns; 
end process;
    
p_rst: process
begin 
    rst<='1'; wait for 15 ns; rst<='0'; wait for 15ns;
 end process;
 
 p_d: process
 begin
    d<= '0'; wait for 0.2 ns;
    d<= '1'; wait for 0.2 ns;
 end process;
 
 end Behavioral;