library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BCDto7seg is

    Port (

        BCD : in  STD_LOGIC_VECTOR(3 downto 0);
        SEG : out STD_LOGIC_VECTOR(6 downto 0)

    );

end BCDto7seg;

architecture Behavioral of BCDto7seg is

begin

    process(BCD)

    begin

        case BCD is

            when "0000" => SEG <= "1111110"; -- 0
            when "0001" => SEG <= "0110000"; -- 1
            when "0010" => SEG <= "1101101"; -- 2
            when "0011" => SEG <= "1111001"; -- 3
            when "0100" => SEG <= "0110011"; -- 4
            when "0101" => SEG <= "1011011"; -- 5
            when "0110" => SEG <= "1011111"; -- 6
            when "0111" => SEG <= "1110000"; -- 7
            when "1000" => SEG <= "1111111"; -- 8
            when "1001" => SEG <= "1111011"; -- 9

            when others => SEG <= "0000000";

        end case;

    end process;

end Behavioral;