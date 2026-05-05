const std = @import("std");

const Signal = struct {
    demand: i32,
    capacity: i32,
    latency: i32,
    risk: i32,
    weight: i32,
};

const threshold: i32 = 166;
const risk_penalty: i32 = 6;
const latency_penalty: i32 = 2;
const weight_bonus: i32 = 5;

fn score(signal: Signal) i32 {
    return signal.demand * 2 + signal.capacity + signal.weight * weight_bonus
        - signal.latency * latency_penalty - signal.risk * risk_penalty;
}

fn classify(signal: Signal) []const u8 {
    return if (score(signal) >= threshold) "accept" else "review";
}

test "fixture decisions" {
    const signal_case_1 = Signal{ .demand = 77, .capacity = 90, .latency = 25, .risk = 5, .weight = 10 };
    try std.testing.expectEqual(@as(i32, 214), score(signal_case_1));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_1), "accept"));
    const signal_case_2 = Signal{ .demand = 67, .capacity = 82, .latency = 22, .risk = 22, .weight = 8 };
    try std.testing.expectEqual(@as(i32, 80), score(signal_case_2));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_2), "review"));
    const signal_case_3 = Signal{ .demand = 95, .capacity = 106, .latency = 15, .risk = 8, .weight = 7 };
    try std.testing.expectEqual(@as(i32, 253), score(signal_case_3));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_3), "accept"));
}
