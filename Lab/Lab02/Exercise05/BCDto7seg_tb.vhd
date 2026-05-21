library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BCDto7seg_tb is
end BCDto7seg_tb;

architecture bench of BCDto7seg_tb is

    component BCDto7seg

        Port (
            BCD : in  STD_LOGIC_VECTOR(3 downto 0);
            SEG : out STD_LOGIC_VECTOR(6 downto 0)
        );

    end component;

    signal BCD_tb : STD_LOGIC_VECTOR(3 downto 0);
    signal SEG_tb : STD_LOGIC_VECTOR(6 downto 0);

begin

    uut : BCDto7seg

        port map (
            BCD => BCD_tb,
            SEG => SEG_tb
        );

    process

    begin

        BCD_tb <= "0000"; wait for 10 ns; -- 0
        BCD_tb <= "0001"; wait for 10 ns; -- 1
        BCD_tb <= "0010"; wait for 10 ns; -- 2
        BCD_tb <= "0011"; wait for 10 ns; -- 3
        BCD_tb <= "0100"; wait for 10 ns; -- 4
        BCD_tb <= "0101"; wait for 10 ns; -- 5
        BCD_tb <= "0110"; wait for 10 ns; -- 6
        BCD_tb <= "0111"; wait for 10 ns; -- 7
        BCD_tb <= "1000"; wait for 10 ns; -- 8
        BCD_tb <= "1001"; wait for 10 ns; -- 9

        wait;

    end process;

end bench;