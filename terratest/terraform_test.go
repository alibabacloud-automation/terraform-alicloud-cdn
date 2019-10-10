package test

import (
	"fmt"
	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/stretchr/testify/assert"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

// An example of how to test the simple Terraform module in examples/terraform-basic-example using Terratest.
func TestTerraformBasicExample(t *testing.T) {
	t.Parallel()
	uniqueNum := random.Random(100000, 999999)
	domainName := fmt.Sprintf("tf-testacc%d.xiaozhu.com", uniqueNum)
	thisType := "web"
	originType := "oss"
	origins := []string{"terraformtest.aliyuncs.com"}

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../",

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"domain_name": domainName,
			"type":        thisType,
			"origin_type": originType,
			"origins":     origins,

			// We also can see how lists and maps translate between terratest and terraform.
		},

		// Disable colors in Terraform commands so its easier to parse stdout/stderr
		NoColor: true,
	}
	// At the end of the test, run `terraform destroy` to clean up any resources that were created

	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the values of output variables
	actualDomainName := terraform.Output(t, terraformOptions, "this_domain_name")
	actualType := terraform.Output(t, terraformOptions, "this_type")
	actualOriginType := terraform.Output(t, terraformOptions, "this_origin_type")
	actualOrigins := terraform.OutputList(t, terraformOptions, "this_origins")

	// Verify we're getting back the outputs we expect
	assert.Equal(t, domainName, actualDomainName)
	assert.Equal(t, thisType, actualType)
	assert.Equal(t, originType, actualOriginType)
	assert.Equal(t, origins, actualOrigins)

}
