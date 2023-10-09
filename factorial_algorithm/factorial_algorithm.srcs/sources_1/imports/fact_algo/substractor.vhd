library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity substractor is
    port(   x : in std_logic_vector (2 downto 0);
            out_subs : out std_logic_vector (2 downto 0));
end substractor;

architecture Behavioral of substractor is

begin
    out_subs <= x-"001";

end Behavioral;
