const std = @import("std");

pub const CatchUserConfig = struct {
    CATCH_CONFIG_CONSOLE_WIDTH: ?u32 = 80,
};

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    var user_config = b.addConfigHeader(.{
        .style = .{ .cmake = .{ .path = "src/catch2/catch_user_config.hpp.in" } },
        .include_path = "catch2/catch_user_config.hpp",
    }, CatchUserConfig{});

    const flags = &[_][]const u8{ "-std=c++17", "-Wall", "-Werror", "-fPIC" };

    const catch2 = b.addStaticLibrary(.{
        .name = "Catch2",
        .target = target,
        .optimize = optimize,
    });
    catch2.addCSourceFiles(&[_][]const u8{
        "src/catch2/benchmark/catch_chronometer.cpp",
        "src/catch2/benchmark/detail/catch_analyse.cpp",
        "src/catch2/benchmark/detail/catch_benchmark_function.cpp",
        "src/catch2/benchmark/detail/catch_run_for_at_least.cpp",
        "src/catch2/benchmark/detail/catch_stats.cpp",
        "src/catch2/catch_approx.cpp",
        "src/catch2/catch_assertion_result.cpp",
        "src/catch2/catch_config.cpp",
        "src/catch2/catch_get_random_seed.cpp",
        "src/catch2/catch_message.cpp",
        "src/catch2/catch_registry_hub.cpp",
        "src/catch2/catch_session.cpp",
        "src/catch2/catch_tag_alias_autoregistrar.cpp",
        "src/catch2/catch_test_case_info.cpp",
        "src/catch2/catch_test_spec.cpp",
        "src/catch2/catch_timer.cpp",
        "src/catch2/catch_tostring.cpp",
        "src/catch2/catch_totals.cpp",
        "src/catch2/catch_translate_exception.cpp",
        "src/catch2/catch_version.cpp",
        "src/catch2/internal/catch_assertion_handler.cpp",
        "src/catch2/internal/catch_case_insensitive_comparisons.cpp",
        "src/catch2/internal/catch_clara.cpp",
        "src/catch2/internal/catch_commandline.cpp",
        "src/catch2/internal/catch_console_colour.cpp",
        "src/catch2/internal/catch_context.cpp",
        "src/catch2/internal/catch_debug_console.cpp",
        "src/catch2/internal/catch_debugger.cpp",
        "src/catch2/internal/catch_decomposer.cpp",
        "src/catch2/internal/catch_enforce.cpp",
        "src/catch2/internal/catch_enum_values_registry.cpp",
        "src/catch2/internal/catch_errno_guard.cpp",
        "src/catch2/internal/catch_exception_translator_registry.cpp",
        "src/catch2/internal/catch_fatal_condition_handler.cpp",
        "src/catch2/internal/catch_floating_point_helpers.cpp",
        "src/catch2/internal/catch_getenv.cpp",
        "src/catch2/internal/catch_istream.cpp",
        "src/catch2/internal/catch_jsonwriter.cpp",
        "src/catch2/internal/catch_lazy_expr.cpp",
        "src/catch2/internal/catch_leak_detector.cpp",
        "src/catch2/internal/catch_list.cpp",
        "src/catch2/internal/catch_message_info.cpp",
        "src/catch2/internal/catch_output_redirect.cpp",
        "src/catch2/internal/catch_parse_numbers.cpp",
        "src/catch2/internal/catch_polyfills.cpp",
        "src/catch2/internal/catch_random_number_generator.cpp",
        "src/catch2/internal/catch_random_seed_generation.cpp",
        "src/catch2/internal/catch_reporter_registry.cpp",
        "src/catch2/internal/catch_reporter_spec_parser.cpp",
        "src/catch2/internal/catch_result_type.cpp",
        "src/catch2/internal/catch_reusable_string_stream.cpp",
        "src/catch2/internal/catch_run_context.cpp",
        "src/catch2/internal/catch_section.cpp",
        "src/catch2/internal/catch_singletons.cpp",
        "src/catch2/internal/catch_source_line_info.cpp",
        "src/catch2/internal/catch_startup_exception_registry.cpp",
        "src/catch2/internal/catch_stdstreams.cpp",
        "src/catch2/internal/catch_string_manip.cpp",
        "src/catch2/internal/catch_stringref.cpp",
        "src/catch2/internal/catch_tag_alias_registry.cpp",
        "src/catch2/internal/catch_test_case_info_hasher.cpp",
        "src/catch2/internal/catch_test_case_registry_impl.cpp",
        "src/catch2/internal/catch_test_case_tracker.cpp",
        "src/catch2/internal/catch_test_failure_exception.cpp",
        "src/catch2/internal/catch_test_registry.cpp",
        "src/catch2/internal/catch_test_spec_parser.cpp",
        "src/catch2/internal/catch_textflow.cpp",
        "src/catch2/internal/catch_uncaught_exceptions.cpp",
        "src/catch2/internal/catch_wildcard_pattern.cpp",
        "src/catch2/internal/catch_xmlwriter.cpp",
        "src/catch2/interfaces/catch_interfaces_capture.cpp",
        "src/catch2/interfaces/catch_interfaces_config.cpp",
        "src/catch2/interfaces/catch_interfaces_exception.cpp",
        "src/catch2/interfaces/catch_interfaces_generatortracker.cpp",
        "src/catch2/interfaces/catch_interfaces_registry_hub.cpp",
        "src/catch2/interfaces/catch_interfaces_reporter.cpp",
        "src/catch2/interfaces/catch_interfaces_reporter_factory.cpp",
        "src/catch2/interfaces/catch_interfaces_testcase.cpp",
        "src/catch2/generators/catch_generator_exception.cpp",
        "src/catch2/generators/catch_generators.cpp",
        "src/catch2/generators/catch_generators_random.cpp",
        "src/catch2/matchers/catch_matchers.cpp",
        "src/catch2/matchers/catch_matchers_container_properties.cpp",
        "src/catch2/matchers/catch_matchers_exception.cpp",
        "src/catch2/matchers/catch_matchers_floating_point.cpp",
        "src/catch2/matchers/catch_matchers_predicate.cpp",
        "src/catch2/matchers/catch_matchers_quantifiers.cpp",
        "src/catch2/matchers/catch_matchers_string.cpp",
        "src/catch2/matchers/catch_matchers_templated.cpp",
        "src/catch2/matchers/internal/catch_matchers_impl.cpp",
        "src/catch2/reporters/catch_reporter_automake.cpp",
        "src/catch2/reporters/catch_reporter_common_base.cpp",
        "src/catch2/reporters/catch_reporter_compact.cpp",
        "src/catch2/reporters/catch_reporter_console.cpp",
        "src/catch2/reporters/catch_reporter_cumulative_base.cpp",
        "src/catch2/reporters/catch_reporter_event_listener.cpp",
        "src/catch2/reporters/catch_reporter_helpers.cpp",
        "src/catch2/reporters/catch_reporter_json.cpp",
        "src/catch2/reporters/catch_reporter_junit.cpp",
        "src/catch2/reporters/catch_reporter_multi.cpp",
        "src/catch2/reporters/catch_reporter_registrars.cpp",
        "src/catch2/reporters/catch_reporter_sonarqube.cpp",
        "src/catch2/reporters/catch_reporter_streaming_base.cpp",
        "src/catch2/reporters/catch_reporter_tap.cpp",
        "src/catch2/reporters/catch_reporter_teamcity.cpp",
        "src/catch2/reporters/catch_reporter_xml.cpp",
    }, flags);
    catch2.addConfigHeader(user_config);
    catch2.addIncludePath(.{ .path = "src/" });
    catch2.linkSystemLibrary("stdc++");
    b.installArtifact(catch2);
    catch2.installConfigHeader(user_config, .{});

    const catch2_with_main = b.addStaticLibrary(.{
        .name = "Catch2Main",
        .target = target,
        .optimize = optimize,
    });
    catch2_with_main.addCSourceFile(.{ .file = .{ .path = "src/catch2/internal/catch_main.cpp" }, .flags = flags });
    catch2_with_main.addConfigHeader(user_config);
    catch2_with_main.addIncludePath(.{ .path = "src/" });
    catch2_with_main.linkSystemLibrary("stdc++");
    b.installArtifact(catch2_with_main);
}
