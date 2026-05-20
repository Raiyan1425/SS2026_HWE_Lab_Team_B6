library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CR_add_sub is

    Port (

        A    : in  STD_LOGIC_VECTOR(3 downto 0);
        B    : in  STD_LOGIC_VECTOR(3 downto 0);
        M    : in  STD_LOGIC;
        S    : out STD_LOGIC_VECTOR(3 downto 0);
        Cout : out STD_LOGIC

    );

end CR_add_sub;

architecture Structural of CR_add_sub is

    component CR_adder

        Port (

            A    : in  STD_LOGIC_VECTOR(3 downto 0);
            B    : in  STD_LOGIC_VECTOR(3 downto 0);
            Cin  : in  STD_LOGIC;
            S    : out STD_LOGIC_VECTOR(3 downto 0);
            Cout : out STD_LOGIC

        );

    end component;

    signal B_xor : STD_LOGIC_VECTOR(3 downto 0);

begin

    B_xor(0) <= B(0) xor M;
    B_xor(1) <= B(1) xor M;
    B_xor(2) <= B(2) xor M;
    B_xor(3) <= B(3) xor M;

    RCA1 : CR_adder

        port map (

            A    => A,
            B    => B_xor,
            Cin  => M,
            S    => S,
            Cout => Cout

        );

end Structural;