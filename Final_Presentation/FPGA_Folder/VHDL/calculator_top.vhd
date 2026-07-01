library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity calculator_top is
    Port (
        CLK       : in  STD_LOGIC;
        A         : in  STD_LOGIC_VECTOR(3 downto 0);
        B         : in  STD_LOGIC_VECTOR(3 downto 0);
        M         : in  STD_LOGIC;
        LED       : out STD_LOGIC_VECTOR(3 downto 0);
        Carry_LED : out STD_LOGIC;
        SEG       : out STD_LOGIC_VECTOR(6 downto 0);
        AN        : out STD_LOGIC_VECTOR(7 downto 0)
    );
end calculator_top;

architecture Behavioral of calculator_top is

    signal sum4        : STD_LOGIC_VECTOR(3 downto 0);
    signal cout        : STD_LOGIC;
    signal result5     : STD_LOGIC_VECTOR(4 downto 0);

    signal tens_digit  : STD_LOGIC_VECTOR(3 downto 0);
    signal ones_digit  : STD_LOGIC_VECTOR(3 downto 0);
    signal refresh_clk : STD_LOGIC;
    signal current_bcd : STD_LOGIC_VECTOR(3 downto 0);

begin

    U1: entity work.CR_add_sub
        port map (
            A    => A,
            B    => B,
            M    => M,
            S    => sum4,
            Cout => cout
        );

    process(M, cout, sum4)
    begin
        if M = '0' then
            -- Addition: use carry as 5th bit
            result5 <= cout & sum4;
            Carry_LED <= cout;
        else
            -- Subtraction: do NOT use Cout as result bit
            -- Cout=1 means no borrow, result is only sum4
            if cout = '1' then
                result5 <= '0' & sum4;
                Carry_LED <= '0';
            else
                -- Negative subtraction protected
                result5 <= "00000";
                Carry_LED <= '1';
            end if;
        end if;
    end process;

    LED <= sum4;

    U2: entity work.binary_to_bcd
        port map (
            bin_in => result5,
            tens   => tens_digit,
            ones   => ones_digit
        );

    U3: entity work.clock_divider
        port map (
            CLK         => CLK,
            refresh_clk => refresh_clk
        );

    U4: entity work.display_mux
        port map (
            refresh_clk => refresh_clk,
            tens        => tens_digit,
            ones        => ones_digit,
            current_bcd => current_bcd,
            AN          => AN
        );

    U5: entity work.BCDto7seg
        port map (
            BCD => current_bcd,
            SEG => SEG
        );

end Behavioral;