library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_bhv_tb is
end full_adder_bhv_tb;

architecture bench of full_adder_bhv_tb is

    component full_adder_bhv

        Port (
            A, B, Cin : in  STD_LOGIC;
            S, Cout   : out STD_LOGIC
        );

    end component;

    signal A_tb    : STD_LOGIC;
    signal B_tb    : STD_LOGIC;
    signal Cin_tb  : STD_LOGIC;

    signal S_tb    : STD_LOGIC;
    signal Cout_tb : STD_LOGIC;

begin

    uut : full_adder_bhv

        port map (
            A    => A_tb,
            B    => B_tb,
            Cin  => Cin_tb,
            S    => S_tb,
            Cout => Cout_tb
        );

    process

    begin

        A_tb <= '0'; B_tb <= '0'; Cin_tb <= '0';
        wait for 10 ns;

        A_tb <= '0'; B_tb <= '0'; Cin_tb <= '1';
        wait for 10 ns;

        A_tb <= '0'; B_tb <= '1'; Cin_tb <= '0';
        wait for 10 ns;

        A_tb <= '0'; B_tb <= '1'; Cin_tb <= '1';
        wait for 10 ns;

        A_tb <= '1'; B_tb <= '0'; Cin_tb <= '0';
        wait for 10 ns;

        A_tb <= '1'; B_tb <= '0'; Cin_tb <= '1';
        wait for 10 ns;

        A_tb <= '1'; B_tb <= '1'; Cin_tb <= '0';
        wait for 10 ns;

        A_tb <= '1'; B_tb <= '1'; Cin_tb <= '1';
        wait for 10 ns;

        wait;

    end process;

end bench;