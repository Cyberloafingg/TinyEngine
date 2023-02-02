#include <TinyEngine.h>

class Sandbox : public TE::Application
{
public:
	Sandbox()
	{

	}

	~Sandbox()
	{

	}
};


TE::Application* TE::CreateApplication()
{
	return new Sandbox();
}