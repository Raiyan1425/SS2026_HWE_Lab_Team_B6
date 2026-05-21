library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CR_adder is

    Port (

        A    : in  STD_LOGIC_VECTOR(3 downto 0);
        B    : in  STD_LOGIC_VECTOR(3 downto 0);
        Cin  : in  STD_LOGIC;
        S    : out STD_LOGIC_VECTOR(3 downto 0);
        Cout : out STD_LOGIC

    );

end CR_adder;

architecture Structural of CR_adder is

    component full_adder

        Port (

            A, B, Cin : in  STD_LOGIC;
            S, Cout   : out STD_LOGIC

        );

    end component;

    signal C1, C2, C3 : STD_LOGIC;

begin

    FA0: full_adder

        port map (

            A    => A(0),
            B    => B(0),
            Cin  => Cin,
            S    => S(0),
            Cout => C1

        );

    FA1: full_adder

        port map (

            A    => A(1),
            B    => B(1),
            Cin  => C1,
            S    => S(1),
            Cout => C2

        );

    FA2: full_adder

        port map (

            A    => A(2),
            B    => B(2),
            Cin  => C2,
            S    => S(2),
            Cout => C3

        );

    FA3: full_adder

        port map (

            A    => A(3),
            B    => B(3),
            Cin  => C3,
            S    => S(3),
            Cout => Cout

        );

end Structural;