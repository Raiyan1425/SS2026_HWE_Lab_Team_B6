library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CR_add_sub_tb is
end CR_add_sub_tb;

architecture bench of CR_add_sub_tb is

    component CR_add_sub

        Port (

            A    : in  STD_LOGIC_VECTOR(3 downto 0);
            B    : in  STD_LOGIC_VECTOR(3 downto 0);
            M    : in  STD_LOGIC;
            S    : out STD_LOGIC_VECTOR(3 downto 0);
            Cout : out STD_LOGIC

        );

    end component;

    signal A_tb    : STD_LOGIC_VECTOR(3 downto 0);
    signal B_tb    : STD_LOGIC_VECTOR(3 downto 0);
    signal M_tb    : STD_LOGIC;

    signal S_tb    : STD_LOGIC_VECTOR(3 downto 0);
    signal Cout_tb : STD_LOGIC;

begin

    uut : CR_add_sub

        port map (

            A    => A_tb,
            B    => B_tb,
            M    => M_tb,
            S    => S_tb,
            Cout => Cout_tb

        );

    process

    begin

        -- Addition
        A_tb <= "0011"; B_tb <= "0010"; M_tb <= '0';
        wait for 10 ns;

        A_tb <= "0111"; B_tb <= "0001"; M_tb <= '0';
        wait for 10 ns;

        -- Subtraction
        A_tb <= "0101"; B_tb <= "0010"; M_tb <= '1';
        wait for 10 ns;

        A_tb <= "1000"; B_tb <= "0011"; M_tb <= '1';
        wait for 10 ns;

        wait;

    end process;

end bench;