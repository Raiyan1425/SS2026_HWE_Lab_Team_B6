library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CR_adder_tb is
end CR_adder_tb;

architecture bench of CR_adder_tb is

    component CR_adder

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

    uut: CR_adder

        port map (

            A    => A_tb,
            B    => B_tb,
            Cin  => Cin_tb,
            S    => S_tb,
            Cout => Cout_tb

        );

    process

    begin

        A_tb <= "0000"; B_tb <= "0000"; Cin_tb <= '0';
        wait for 10 ns;

        A_tb <= "0001"; B_tb <= "0001"; Cin_tb <= '0';
        wait for 10 ns;

        A_tb <= "0010"; B_tb <= "0011"; Cin_tb <= '0';
        wait for 10 ns;

        A_tb <= "0101"; B_tb <= "0011"; Cin_tb <= '0';
        wait for 10 ns;

        A_tb <= "0111"; B_tb <= "0001"; Cin_tb <= '1';
        wait for 10 ns;

        A_tb <= "1111"; B_tb <= "0001"; Cin_tb <= '0';
        wait for 10 ns;

        A_tb <= "1111"; B_tb <= "1111"; Cin_tb <= '0';
        wait for 10 ns;

        A_tb <= "1010"; B_tb <= "0101"; Cin_tb <= '1';
        wait for 10 ns;

        wait;

    end process;

end bench;