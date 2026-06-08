library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_subtractor_bhv is

    Port (
        A, B, Bin : in  STD_LOGIC;
        D, Bout   : out STD_LOGIC
    );

end full_subtractor_bhv;

architecture Behavioral of full_subtractor_bhv is

begin

    D <= A xor B xor Bin;

    Bout <= ((not A) and B) or
             ((not A) and Bin) or
             (B and Bin);

end Behavioral;