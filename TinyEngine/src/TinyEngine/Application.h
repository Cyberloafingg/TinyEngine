#pragma once
#include "Core.h"


namespace TE{

	class TE_API Application
	{
	public:
		Application();

		virtual ~Application();

		void Run();
	};

	//To be defined in CLIENT
	Application* CreateApplication();

}
