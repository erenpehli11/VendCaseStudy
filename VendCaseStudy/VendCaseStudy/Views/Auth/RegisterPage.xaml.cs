using VendCaseStudy.ViewModels;

namespace VendCaseStudy.Views.Auth;

public partial class RegisterPage : ContentPage
{
    public RegisterPage(RegisterViewModel viewModel)
    {
        InitializeComponent();
        BindingContext = viewModel;
    }
}