library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_subtractor is

    Port (
        A    : in  STD_LOGIC;
        B    : in  STD_LOGIC;
        D    : out STD_LOGIC;
        Bout : out STD_LOGIC
    );

end half_subtractor;

architecture Behavioral of half_subtractor is

begin

    D <= A xor B;

    Bout <= (not A) and B;

end Behavioral;