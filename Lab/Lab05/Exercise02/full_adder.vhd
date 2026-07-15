library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is

    Port (

        A, B, Cin : in STD_LOGIC;
        S, Cout   : out STD_LOGIC

    );

end full_adder;

architecture Structural of full_adder is

    component half_adder

        Port (

            A, B : in STD_LOGIC;
            S, C : out STD_LOGIC

        );

    end component;

    signal S1, C1, C2 : STD_LOGIC;

begin

    HA1: half_adder

        port map (

            A => A,
            B => B,
            S => S1,
            C => C1

        );

    HA2: half_adder

        port map (

            A => S1,
            B => Cin,
            S => S,
            C => C2

        );

    Cout <= C1 OR C2;

end Structural;