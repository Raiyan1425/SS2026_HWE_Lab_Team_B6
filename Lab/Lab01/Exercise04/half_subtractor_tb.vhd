library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_subtractor_tb is
end half_subtractor_tb;

architecture bench of half_subtractor_tb is

    component half_subtractor
        Port (
            A    : in  STD_LOGIC;
            B    : in  STD_LOGIC;
            D    : out STD_LOGIC;
            Bout : out STD_LOGIC
        );
    end component;

    signal A_tb    : STD_LOGIC;
    signal B_tb    : STD_LOGIC;
    signal D_tb    : STD_LOGIC;
    signal Bout_tb : STD_LOGIC;

begin

    uut : half_subtractor
        port map (
            A    => A_tb,
            B    => B_tb,
            D    => D_tb,
            Bout => Bout_tb
        );

    process
    begin
        A_tb <= '0'; B_tb <= '0';
        wait for 10 ns;

        A_tb <= '0'; B_tb <= '1';
        wait for 10 ns;

        A_tb <= '1'; B_tb <= '0';
        wait for 10 ns;

        A_tb <= '1'; B_tb <= '1';
        wait for 10 ns;

        wait;
    end process;

end bench;