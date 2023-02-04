#pragma once

#include "Core.h"
#include "spdlog/spdlog.h"
#include "spdlog/fmt/ostr.h"

namespace TE {

	class TE_API Log
	{
	public:
		static void Init();

		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() {return s_CoreLogger; }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() {return s_ClientLogger; }

	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;
	};
}

// Core Log Macros
#define TE_CORE_TRACE(...)	::TE::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define TE_CORE_INFO(...)	::TE::Log::GetCoreLogger()->info(__VA_ARGS__)
#define TE_CORE_WARN(...)	::TE::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define TE_CORE_ERROR(...)	::TE::Log::GetCoreLogger()->error(__VA_ARGS__)
#define TE_CORE_FATAL(...)	::TE::Log::GetCoreLogger()->fatal(__VA_ARGS__)
// Client Log Macros
#define TE_TRACE(...)	::TE::Log::GetClientLogger()->trace(__VA_ARGS__)
#define TE_INFO(...)	::TE::Log::GetClientLogger()->info(__VA_ARGS__)
#define TE_WARN(...)	::TE::Log::GetClientLogger()->warn(__VA_ARGS__)
#define TE_ERROR(...)	::TE::Log::GetClientLogger()->error(__VA_ARGS__)
#define TE_FATAL(...)	::TE::Log::GetClientLogger()->fatal(__VA_ARGS__)