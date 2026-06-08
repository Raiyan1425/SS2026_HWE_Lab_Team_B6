library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_subtractor_bhv_tb is
end full_subtractor_bhv_tb;

architecture bench of full_subtractor_bhv_tb is

    component full_subtractor_bhv

        Port (
            A, B, Bin : in  STD_LOGIC;
            D, Bout   : out STD_LOGIC
        );

    end component;

    signal A_tb    : STD_LOGIC;
    signal B_tb    : STD_LOGIC;
    signal Bin_tb  : STD_LOGIC;

    signal D_tb    : STD_LOGIC;
    signal Bout_tb : STD_LOGIC;

begin

    uut : full_subtractor_bhv

        port map (
            A    => A_tb,
            B    => B_tb,
            Bin  => Bin_tb,
            D    => D_tb,
            Bout => Bout_tb
        );

    process

    begin

        A_tb <= '0'; B_tb <= '0'; Bin_tb <= '0';
        wait for 10 ns;

        A_tb <= '0'; B_tb <= '0'; Bin_tb <= '1';
        wait for 10 ns;

        A_tb <= '0'; B_tb <= '1'; Bin_tb <= '0';
        wait for 10 ns;

        A_tb <= '0'; B_tb <= '1'; Bin_tb <= '1';
        wait for 10 ns;

        A_tb <= '1'; B_tb <= '0'; Bin_tb <= '0';
        wait for 10 ns;

        A_tb <= '1'; B_tb <= '0'; Bin_tb <= '1';
        wait for 10 ns;

        A_tb <= '1'; B_tb <= '1'; Bin_tb <= '0';
        wait for 10 ns;

        A_tb <= '1'; B_tb <= '1'; Bin_tb <= '1';
        wait for 10 ns;

        wait;

    end process;

end bench;