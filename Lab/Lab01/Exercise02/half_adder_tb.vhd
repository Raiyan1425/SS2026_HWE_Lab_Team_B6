library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_adder_tb is
end half_adder_tb;

architecture bench of half_adder_tb is

    component half_adder

        Port (

            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            S : out STD_LOGIC;
            C : out STD_LOGIC

        );

    end component;

    signal A_tb : STD_LOGIC;
    signal B_tb : STD_LOGIC;

    signal S_tb : STD_LOGIC;
    signal C_tb : STD_LOGIC;

begin

    uut : half_adder

        port map (

            A => A_tb,
            B => B_tb,
            S => S_tb,
            C => C_tb

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