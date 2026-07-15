entity clk_divider_tb is
end clk_divider_tb;

architecture Behavioral of clk_divider_tb is

    signal CLK   : BIT := '0';
    signal CLK_N : BIT;

    constant CLK_PERIOD : time := 10 ns;

begin

    uut: entity work.clk_divider
        generic map (
            N => 4
        )
        port map (
            CLK   => CLK,
            CLK_N => CLK_N
        );

    clk_process : process
    begin
        while true loop
            CLK <= '0';
            wait for CLK_PERIOD / 2;
            CLK <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;

end Behavioral;