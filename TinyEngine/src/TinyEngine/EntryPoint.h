#pragma once

#ifdef TE_PLATFORM_WONDOWS

extern TE::Application* TE::CreateApplication();

int main(int argc, char** argv)
{
	//printf("*******Tiny Engine Start**********");
	auto app = TE::CreateApplication();
	app->Run();
	delete app;
}

#endif //TE_PLATFORM_WONDOWS
