library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BCD_adder_tb is
end BCD_adder_tb;

architecture bench of BCD_adder_tb is

    component BCD_adder

        Port (

            A    : in  STD_LOGIC_VECTOR(3 downto 0);
            B    : in  STD_LOGIC_VECTOR(3 downto 0);
            Cin  : in  STD_LOGIC;
            S    : out STD_LOGIC_VECTOR(3 downto 0);
            Cout : out STD_LOGIC

        );

    end component;

    signal A_tb    : STD_LOGIC_VECTOR(3 downto 0);
    signal B_tb    : STD_LOGIC_VECTOR(3 downto 0);
    signal Cin_tb  : STD_LOGIC;
    signal S_tb    : STD_LOGIC_VECTOR(3 downto 0);
    signal Cout_tb : STD_LOGIC;

begin

    uut : BCD_adder

        port map (

            A    => A_tb,
            B    => B_tb,
            Cin  => Cin_tb,
            S    => S_tb,
            Cout => Cout_tb

        );

    process

    begin

        -- 2 + 3 = 5
        A_tb <= "0010"; B_tb <= "0011"; Cin_tb <= '0';
        wait for 10 ns;

        -- 4 + 5 = 9
        A_tb <= "0100"; B_tb <= "0101"; Cin_tb <= '0';
        wait for 10 ns;

        -- 5 + 5 = 10 => Cout=1, S=0000
        A_tb <= "0101"; B_tb <= "0101"; Cin_tb <= '0';
        wait for 10 ns;

        -- 8 + 7 = 15 => Cout=1, S=0101
        A_tb <= "1000"; B_tb <= "0111"; Cin_tb <= '0';
        wait for 10 ns;

        -- 9 + 9 = 18 => Cout=1, S=1000
        A_tb <= "1001"; B_tb <= "1001"; Cin_tb <= '0';
        wait for 10 ns;

        wait;

    end process;

end bench;