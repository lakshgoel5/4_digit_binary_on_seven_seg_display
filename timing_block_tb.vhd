library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity timing_block_tb is
-- No ports needed for the testbench
end timing_block_tb;

architecture Behavioral of timing_block_tb is
    -- Component declaration of the Timing_block
    component Timing_block
        Port (
            clk_in : in STD_LOGIC;               -- 100 MHz input clock
--            reset : in STD_LOGIC;                -- Reset signal
            mux_select : out STD_LOGIC_VECTOR (1 downto 0); -- Signal for the mux
            anodes : out STD_LOGIC_VECTOR (3 downto 0)        -- Anodes signal for display
        );
    end component;

    -- Signals for the testbench
    signal clk_in_tb : STD_LOGIC := '0';
--    signal reset_tb : STD_LOGIC := '0';
    signal mux_select_tb : STD_LOGIC_VECTOR (1 downto 0);
    signal anodes_tb : STD_LOGIC_VECTOR (3 downto 0);

    -- Clock period definition for 100 MHz clock (10 ns period)
    constant clk_period : time := 2 ns;

begin
    -- Instantiate the Timing_block
    UUT: Timing_block port map(
        clk_in => clk_in_tb,
--        reset => reset_tb,
        mux_select => mux_select_tb,
        anodes => anodes_tb
    );

    -- Clock generation process
    clk_process: process
    begin
        while true loop
            clk_in_tb <= '0';
            wait for clk_period/2;
            clk_in_tb <= '1';
            wait for clk_period/2;
        end loop;
    end process;

--    end process;

end Behavioral;
