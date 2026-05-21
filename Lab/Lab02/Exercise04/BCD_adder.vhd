library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BCD_adder is

    Port (

        A    : in  STD_LOGIC_VECTOR(3 downto 0);
        B    : in  STD_LOGIC_VECTOR(3 downto 0);
        Cin  : in  STD_LOGIC;
        S    : out STD_LOGIC_VECTOR(3 downto 0);
        Cout : out STD_LOGIC

    );

end BCD_adder;

architecture Structural of BCD_adder is

    component CR_adder

        Port (

            A    : in  STD_LOGIC_VECTOR(3 downto 0);
            B    : in  STD_LOGIC_VECTOR(3 downto 0);
            Cin  : in  STD_LOGIC;
            S    : out STD_LOGIC_VECTOR(3 downto 0);
            Cout : out STD_LOGIC

        );

    end component;

    signal Z       : STD_LOGIC_VECTOR(3 downto 0);
    signal C1      : STD_LOGIC;
    signal K       : STD_LOGIC;
    signal Corr    : STD_LOGIC_VECTOR(3 downto 0);
    signal C2      : STD_LOGIC;

begin

    ADD1 : CR_adder

        port map (

            A    => A,
            B    => B,
            Cin  => Cin,
            S    => Z,
            Cout => C1

        );

    K <= C1 or (Z(3) and Z(2)) or (Z(3) and Z(1));

    Corr(0) <= '0';
    Corr(1) <= K;
    Corr(2) <= K;
    Corr(3) <= '0';

    ADD2 : CR_adder

        port map (

            A    => Z,
            B    => Corr,
            Cin  => '0',
            S    => S,
            Cout => C2

        );

    Cout <= K;

end Structural;